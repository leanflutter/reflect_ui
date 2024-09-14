import { Meta, StoryObj } from "@storybook/react";
import { NavList } from "./NavList";

const meta = {
  title: "Widgets/NavList",
  component: NavList,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    label: { control: { type: "text" } },
  },
} satisfies Meta<typeof NavList>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
