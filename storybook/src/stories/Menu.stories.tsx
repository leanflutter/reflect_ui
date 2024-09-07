import { Meta, StoryObj } from "@storybook/react";
import { Menu } from "./Menu";

const meta = {
  title: "Widgets/Menu",
  component: Menu,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    label: { control: { type: "text" } },
  },
} satisfies Meta<typeof Menu>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
