import { Meta, StoryObj } from "@storybook/react";
import { ContextMenuRegion } from "./ContextMenuRegion";

const meta = {
  title: "Widgets/ContextMenuRegion",
  component: ContextMenuRegion,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    label: { control: { type: "text" } },
  },
} satisfies Meta<typeof ContextMenuRegion>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
